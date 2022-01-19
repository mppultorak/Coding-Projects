# Michael Pultorak Q5
def largest_sum(list2):
    maximum = 0
    out = None
    for list1 in list2:
        current = 0
        for num in list1:
            current += num
            if current > maximum:
                maximum = current
                out = list1
    return out

print(largest_sum([[2,4],[1,3],[0,1],[5,0]] ))