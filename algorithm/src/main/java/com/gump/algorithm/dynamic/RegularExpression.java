package com.gump.algorithm.dynamic;

/**
 * @Description: 正则表达式
 *  https://leetcode-cn.com/problems/regular-expression-matching/
 * @Author gumpLiu
 * @Date 2020-06-12
 * @Version V1.0
 **/
public class RegularExpression {

    // 状态空间
    Result[][] memo;

    public boolean isMatch(String text, String pattern) {
        memo = new Result[text.length() + 1][pattern.length() + 1];
        return match(0, 0, text, pattern);
    }

    public boolean match(int i, int j, String text, String pattern) {
        if (memo[i][j] != null) {
            return memo[i][j] == Result.TRUE;
        }
        boolean ans;
        if (j == pattern.length()){
            ans = i == text.length();
        } else{
            boolean curMatch = (i < text.length() &&
                    (pattern.charAt(j) == text.charAt(i) ||
                            pattern.charAt(j) == '.'));

            if (j + 1 < pattern.length() && pattern.charAt(j+1) == '*'){
                ans = (match(i, j+2, text, pattern) ||
                        curMatch && match(i+1, j, text, pattern));
            } else {
                ans = curMatch && match(i+1, j+1, text, pattern);
            }
        }
        memo[i][j] = ans ? Result.TRUE : Result.FALSE;
        return ans;
    }
}

enum Result {
    TRUE, FALSE
}
