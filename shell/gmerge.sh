#!/bin/bash

cd "/home/work/php/paas_cloud_api"

branch=''
if [ -d '.git' ]; then
    output=`git describe --contains --all HEAD|tr -s '\n'`
    if [ "$output" ]; then
        branch="${output}"
    fi
fi

if [ ${branch} == "develop" ]
then
    echo "添加文件"
    git add .
    echo "提交文件"
    git commit -m "fix"
    
    echo "正在执行git pull"
    git pull
    
    echo "push文件"
    git push
    
    echo "切换 test"
    git checkout test
    
    echo "何并代码"
    git merge --no-ff develop
    
    echo "提交"
    git commit -m "fix"
    
    echo "更新代码"
    git pull
    
    echo "推送远程"
    git push
    
    echo "切换回原来分支"
    git checkout develop
    
elif [  ${branch} == "test" ]
then

    echo "切换回开发分支"
    git checkout develop
    
    echo "添加文件"
    git add .
    echo "提交文件"
    git commit -m "fix"
    
    echo "正在执行git pull"
    git pull
    
    echo "push文件"
    git push
    
    echo "切换 test"
    git checkout test
    
    echo "何并代码"
    git merge --no-ff develop
    
    echo "提交"
    git commit -m "fix"
    
    echo "更新代码"
    git pull
    
    echo "推送远程"
    git push
    
    echo "切换回原来分支"
    git checkout develop
else
    echo "不是一个有效的分支"
fi
