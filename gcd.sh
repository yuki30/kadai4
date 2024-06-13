
# 引数が2つあるか確認する
if [ "$#" -ne 2 ]; then
    echo "数字: $0 num1 num2" >&2
    exit 1
fi

# 両方の引数が自然数であることを確認する
if ! [[ "$1" =~ ^[0-9]+$ ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
    echo "エラー: 引数は自然数でないです" >&2
    exit 1
fi

num1=$1
num2=$2

# 最大公約数を計算する関数
gcd() {
    local a=$1
    local b=$2
    while [ "$b" -ne 0 ]; do
        local temp=$b
        b=$((a % b))
        a=$temp    done
    echo "$a"
}

# 最大公約数を計算して出力
gcd_result=$(gcd "$num1" "$num2")
echo "$gcd_result"
