#!/usr/bin bash
# myman command

DOCS_PATH="/home/developer/guo/myman/docs"
REPO_CMDS_URL="https://raw.githubusercontent.com/guoruibiao/worktools/master/myman/commands.list"
CMD_DOWNLOAD_URL="https://raw.githubusercontent.com/guoruibiao/worktools/master/myman/docs/"
LOCAL_AVAIABLE_COMMANDS=`ls $DOCS_PATH | tr "\t" "\n"`
echo ""
for item in ${LOCAL_AVAIABLE_COMMANDS[@]}
do
    if test  "$1" == "$item";then
        cat $DOCS_PATH/$1
        exit 0
    fi
done

# 更新docs
if test "$1" == "update";then
    # 做更新逻辑
    curl -s $CMD_DOWNLOAD_URL$2 > $DOCS_PATH/$2 
    echo "[$2] 命令已更新"
elif test "$1" == "install";then
    # 下载并保存到本地
    curl -s $CMD_DOWNLOAD_URL$2 > $DOCS_PATH/$2 
    echo "[$2] 成功下载到本地啦"
elif test "$1" == "list";then
    echo "本地已安装命令文档:"
    echo $LOCAL_AVAIABLE_COMMANDS
    REPO_AVAIABLE_COMMANDS=`curl -s $REPO_CMDS_URL`
    echo "云端可用命令文档:"
    echo $REPO_AVAIABLE_COMMANDS
    echo "列出还可以下载的云端命令列表吧TODO"
else
    echo "Command ["$1"] not found." 
fi
