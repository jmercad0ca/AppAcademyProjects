Array.prototype.bubbleSort = function(array){
    let sorted = false;
    while (!sorted){
        sorted = true;
        for (let i = 0; i < array.length-1; i++){
            if (array[i] > array[i+1]){
                let temp = array[i+1];
                array[i+1] = array[i];
                array[i] = temp;
                sorted = false;
            }
        }
    }
    return array;
}

String.prototype.substrings = function(string) {
    let substrings = new Set()
    for (let i = 0; i < string.length; i++){
        for (let j = i+1; j <= string.length; j++){
            substrings.add(string.slice(i,j));
        }
    }
    return Array.from(substrings);
}