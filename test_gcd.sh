# 出力が正しいかどうかを確認する関数
check_output() {
    local output=$1
    local expected=$2
    if [ "$output" -ne "$expected" ]; then
        echo "テスト失敗: 期待値 $expected, 実際の値 $output" >&2
        exit 1
    fi
}

# テストケース
output=$(./gcd.sh 2 4)
check_output "$output" 2

output=$(./gcd.sh 12 15)
check_output "$output" 3

output=$(./gcd.sh 7 13)
check_output "$output" 1

# 不正な入力の確認
if ./gcd.sh 3; then
    echo "テスト失敗: 引数が1つでエラー発生せず" >&2
    exit 1
fi

if ./gcd.sh 3 abc; then
    echo "テスト失敗:数値以外でエラー発生せず" >&2
    exit 1
fi

echo "ALL Passed"
