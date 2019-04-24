#!/usr/bin/env bash
function getTimeDistance()
{
    local ss2=$2
    local ss1=$1
    local time_distance_stamp=$(( $ss2 - $ss1 ));
    local hour_distance=$(expr ${time_distance_stamp} / 3600)
    local hour_remainder=$(expr ${time_distance_stamp} % 3600)
    local min_distance=$(expr ${hour_remainder} / 60)
    local min_remainder=$(expr ${hour_remainder} % 60)

    # 函数return只能返回数字，因此定义全局变量
    time_distance="${hour_distance}时${min_distance}分${min_remainder}秒"
}

start_time=$(date "+%Y-%m-%d %H:%M:%S")
start_time_stamp=`date +%s`

########编译开始##########
echo "编译开始了"

bash gradlew assembleDebug --info

echo "编译结束了"
########编译结束了##########

end_time=$(date "+%Y-%m-%d %H:%M:%S")
end_time_stamp=`date +%s`
echo "开始编译时间： $start_time"
echo "完成编译时间： $end_time"

# 调用自定义方法，获取时间差
getTimeDistance "$start_time_stamp" "$end_time_stamp"
echo "编译总时长：$time_distance"

