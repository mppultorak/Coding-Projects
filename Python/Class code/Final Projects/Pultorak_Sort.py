str_list = ['computer', 'machine', 'device', 'science', 'python', 'language']
for i in range(len(str_list)):
    min_idx = i
    min_int = str_list[i]
    for other in range(i+1, len(str_list)):
        if min_int > str_list[other]:
            min_int, min_idx = str_list[other], other

    if min_idx != i:
        x = str_list[i]
        str_list[i] = str_list[min_idx]
        str_list[min_idx] = x

"""
Its runtime complexity is n*n due to the list effectively needing to be sorted over twice.
This is due to the nested loop.
"""