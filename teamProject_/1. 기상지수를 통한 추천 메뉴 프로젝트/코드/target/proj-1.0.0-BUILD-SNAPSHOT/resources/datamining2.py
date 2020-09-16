from sklearn import svm,metrics
import pandas as pd
import os
import numpy as np
from numpy import NaN
from sklearn.model_selection import train_test_split
resultlist=['한식','중식','일식','양식','분식','뷔페''패스트푸드','편의점']
list=["불쾌","식중독","동파","열","더위","체감온도","대기확산","자외선"]
# 데이터 추출
path="E:\\file\\spring\\workspace\\springProject2\\src\\main\\webapp\\resources\\recomm"
path_dir=os.listdir(path+"\\csv\\")
# 생활지수 데이터 불러오기
csv0=pd.read_csv(path+'\\jisu\\jisuData.csv',encoding='utf-8', header=None)
print(csv0)
csv0=csv0.replace(999.0, 0)
print(csv0)
csv0.columns=["no","지점번호","날짜","불쾌","식중독","동파","열","더위","체감온도","대기확산","자외선"]
data=csv0.groupby(['날짜'])["불쾌","식중독","동파","열","더위","체감온도","대기확산","자외선"].mean()
data=data.reset_index()
data["날짜"]=data["날짜"].apply(str)
data["날짜"]=data["날짜"].str.slice(0, 8)
csv_data1=data.groupby(['날짜'])["불쾌","식중독","동파","열","더위","체감온도","대기확산","자외선"].max()
print(csv_data1)

# 좋아요 데이터 불러오기
csv_name=[]
for i in path_dir:
    csv_name.append(i[8:])
print(csv_name)

filename=[]
for file in path_dir:
    filename.append(file[8:-5])
dfList=[]
i=0
for file in path_dir:
    df=pd.read_csv(path + "\\csv\\" + file, encoding="utf-8", header=None)
    df.columns=['번호', '날짜', filename[i]]
    dfList.append(df[filename[i]])
    i+=1
dfList.append(df['날짜'])
csv_label1=pd.concat(dfList, axis=1)
csv_label1=csv_label1.loc[:,filename]
print(csv_label1)
csv_data1=csv_data1.loc[:,["불쾌","식중독","동파","열","더위","체감온도","대기확산","자외선"]]
csv_data1=csv_data1.tail(len(csv_label1))
print(csv_data1)

# 분석
data=[]
label=[]
test_data=csv_data1.tail(1)
print(test_data)
# 학습, 예측
# print(label)
# print(data)
pre=[]
for i in range(len(filename)):
    clf=svm.SVC()
    clf.fit(csv_data1, csv_label1.iloc[:,i])
    pre.append(clf.predict(test_data)[0])
    print("예측값: ",pre)
df1=pd.DataFrame(data=pre, index=filename)
print(df1)
df1.to_csv(path+'\\result\\'+'prediction.csv', encoding="utf-8", mode="w", index=True)
