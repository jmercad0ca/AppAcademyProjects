Array.prototype.uniq = function(){
    return Array.from(new Set(this));
}

Array.prototype.twoSum = function(){
    const nums = new Map();
    let sumPairs = []
    for (let i = 0; i < this.length; i++){
        for (let j = i; j < this.length; j++){
            if (this[i] + this[j] === 0){
                sumPairs.push([i,j]);
            }
        }
    }
    return sumPairs;
}

Array.prototype.transpose = function(){
    if (this.length === 0){
        return [];
    }
    let transpose = new Array(this[0].length).fill(null).map(() => new Array())
    for (let i = 0; i < this.length; i++){
        for (let j = 0; j < this[0].length; j++){
            transpose[j].push(this[i][j])
        }
    }
    return transpose
}
