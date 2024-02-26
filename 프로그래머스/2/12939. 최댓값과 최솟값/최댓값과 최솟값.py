def solution(s):
    s = s.split()
    min_num = 9999
    max_num = -9999
    answer = ''
    for i in range(len(s)):
        if int(s[i]) > max_num:
            max_num = int(s[i])
        if int(s[i]) < min_num:
            min_num = int(s[i])
    answer += str(min_num)
    answer += ' '
    answer += str(max_num)
    return answer