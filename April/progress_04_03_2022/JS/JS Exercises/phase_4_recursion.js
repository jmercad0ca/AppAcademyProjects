function range(start, end){
    if (start > end){
        return [];
    }
    else if (start === end){
        return [start];
    }
    else{
        let arr = [start];
        return arr.concat(range(start + 1, end));
    }
}

function sumRec(arr) {
    if (arr.length === 0) {
        return 0;
    }
    else{
        return arr[0] + sumRec(arr.slice(1,arr.length));
    }
}

// function exponent(base, exp){
//     if (exp === 0){
//         return 1;
//     }
//     else {
//         return base * exponent(base,exp-1)
//     }
// }

function exponent(base, exp) {
    if (exp === 0){
        return 1;
    }
    else if (exp === 1){
        return base;
    }
    else if (exp % 2 === 0){
        return exponent(base, exp/2) ** 2
    }
    else if (exp % 2 === 1){
        return base * (exponent(base,(exp-1)/2) ** 2);
    }
    else{
        return -1;
    }
}

function fibonacci(n){
    if (n <= 0){
        return []
    }
    else if (n === 1){
        return [1]
    }
    else if (n === 2){
        return [1,1]
    }
    else {
        let previous = fibonacci(n-1);
        previous.push(previous[previous.length - 1] + previous[previous.length - 2]);
        return previous
    }
}

function deepDup(arr){
    return JSON.parse(JSON.stringify(arr));
}

function bsearch(arr,target){
    let mid = Math.floor(arr.length / 2);
    if ((arr.length === 1 && arr[mid] !== target) || arr.length === 0){
        return -1;
    }
    else if (target === arr[mid]){
        return mid
    }
    else if (target < arr[mid]){
        return bsearch(arr.slice(0,mid),target);
    }
    else{
        return mid + bsearch(arr.slice(mid,arr.length),target);
    }
}

function mergesort(arr){
    if (arr.length === 1){
        return [arr[0]];
    }
    else{
        let mid = Math.floor(arr.length / 2);
        let left = mergesort(arr.slice(0,mid));
        let right = mergesort(arr.slice(mid,arr.length));
        let merge = [];
        while (left.length !== 0 && right.length !== 0){
            if (left[0] <= right[0]){
                merge.push(left.shift());
            }
            else{
                merge.push(right.shift());
            }
        }
        return merge.concat(left).concat(right);
    }
}

function subsets(array) {
    if (array.length === 0) {
        return [[]];
    }

    const first = array[0];
    const withoutFirst = subsets(array.slice(1));
    // remember, we don't want to mutate the subsets without the first element
    // hence, the 'concat'
    const withFirst = withoutFirst.map(sub => [first].concat(sub));

    return withoutFirst.concat(withFirst);
}