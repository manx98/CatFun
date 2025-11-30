#!/bin/bash
TOP_DIR=$(dirname "$0")
TOP_DIR=$(realpath "$TOP_DIR")

log_fault() {
    echo "$1"
    exit 1
}

echo "生成版本号文件"

if ! bash script/fetch_git_info.sh
then
    log_fault "无法生成版本号文件"
fi

echo "开始构建 JS 运行时组件"
bundle_dir="$TOP_DIR/JS/bundle"
if ! cd "$bundle_dir"
then
    log_fault "无法进入目录: $bundle_dir"
fi

if ! npm install
then
    log_fault "无法安装必要依赖"
fi

if ! npm run build
then
    log_fault "构建失败"
fi

echo "开始构建内置模板文件"
cli_dir="$TOP_DIR/JS/cli"

if ! cd "$cli_dir"
then
    log_fault "无法进入目录: $cli_dir"
fi

if ! npm install
then
    log_fault "无法安装 cli 必要依赖"
fi

types_dir="$TOP_DIR/JS/types"

if ! cd "$types_dir"
then
    log_fault "无法进入目录: $types_dir"
fi

if ! npm install
then
    log_fault "无法安装 types 必要依赖"
fi

templates_dir="$TOP_DIR/packages/xi/lib/adapters/templates"
if ! cd "$templates_dir"
then
    log_fault "无法进入目录: $templates_dir"
fi

if ! npm install
then
    log_fault "无法安装 templates 必要依赖"
fi

if ! npm run build
then
    log_fault "无法生成 templates.dart"
fi