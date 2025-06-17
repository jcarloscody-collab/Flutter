var a = (a, b) => a + b

function Ret(al, lar) {
    this.al = al
    this.lar = lar
    this.area =  ()=>{
        return this.al + this.lar
    }
}
this.al = 1
this.lar = 1
var ret = new Ret(10,10)

var b = ret.area
console.log(b())
console.log(a(10, 15))