# Online Python - IDE, Editor, Compiler, Interpreter

#verify if array is sorted or unsorted. give orientation,
#asending or descending


def arraycompare(array):
    
    count = 0
    
    for x in range(1,len(array),1):
        
        if array[x-1]<array[x]:
            count = count + 1
            
            print(count)
            continue

    if len(array)==count+1:
        return True
        
    else:
        return False



arr1 = ['13','14','15','17','11','9']
print(arraycompare(arr1))
