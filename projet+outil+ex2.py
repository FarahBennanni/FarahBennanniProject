
# coding: utf-8

# In[3]:

def minprod(x,k):
    resultat=1
    i=0 
    while k>0:
        print("i :", i)
        i+=1
        if k%2==1:
            resultat=resultat*x
        x=x*x
        k=k//2
    print("{}","{}".format(i,resultat))






