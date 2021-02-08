import time

def is_palindrome(n):
    return str(n) == str(n)[::-1]

def square_sum(n,m):
    """ n**2 + (n+1)**2 + ... + m**2"""
    return (m*(m+1)*(2*m+1) - (n-1)*n*(2*n-1)) // 6

result = []
for m in range(1,10**4+1):
    for n in range(1,m):
        x = square_sum(n,m)
        if x >= 10**8:
            continue
        if is_palindrome(x):
            result.append(x)

print(sorted(set(result)))
print(sum(set(result)))












start = time.time()
tmp = [square_sum(1,x) for x in range(1,10000)]
print(time.time() - start)

start = time.time()
tmp = [square_sum2(1,x) for x in range(1,10000)]
print(time.time() - start)
