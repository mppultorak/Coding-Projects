# Michael Pultorak Q1
def sublist_check(list1, list2):
    for val in list2:
        if val not in list1:
            return False
    return True
