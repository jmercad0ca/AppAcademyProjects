Array.prototype.myEach = function(callback){
    for (let i = 0; i < this.length; i++){
        callback(this[i]);
    }
}

Array.prototype.myMap = function(callback){
    let newArr = []
    let mapCallback = function (element){
        newArr.push(callback(element));
    }
    this.myEach(mapCallback);
    return newArr;
}

Array.prototype.myReduce = function(callback, initialValue=0) {
    let result = initialValue;
    let reduceCallback = function(element){
        result = callback(result,element);
    }
    this.myEach(reduceCallback);
    return result;
}