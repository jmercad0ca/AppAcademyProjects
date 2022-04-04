class Cat {
    constructor(name,owner){
        this.name = name;
        this.owner = owner;
    }
    
}
Cat.prototype.cuteStatement = function() {
    return `${this.owner} loves ${this.name}`
}

Cat.prototype.meow = function () {
    return 'meoooowww! :)'
}