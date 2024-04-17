function solution(num_str) {
    let numsum = 0;
    for (const s of num_str){
    numsum += parseInt(s)
}
    return numsum;
}