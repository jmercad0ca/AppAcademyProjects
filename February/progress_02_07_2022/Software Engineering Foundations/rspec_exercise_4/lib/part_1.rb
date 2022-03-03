def my_reject(array,&prc)
    rejects = []
    array.each{ |ele| rejects << ele if !prc.call(ele) }
    rejects
end

def my_one?(array,&prc)
    count = 0
    array.each{ |ele| count += 1 if prc.call(ele)}
    count == 1
end

def hash_select(hash,&prc)
    selected = {}
    hash.each{ |k,v| selected[k] = v if prc.call(k,v)}
    selected
end

def xor_select(array, prc_1, prc_2)
    xored = []
    array.each { |ele| xored << ele if (prc_1.call(ele)) ^ (prc_2.call(ele)) }
    xored
end

def proc_count(value,procs)
    count = 0
    procs.each{ |prc| count += 1 if prc.call(value)}  
    count
end