終端執行語句

初始建立時使用
docker build -t my-node-red .

docker run -it -p 1880:1880 -v ~/node-red-data:/data --name node-red my-node-red

****上面build成功後，會創建出volume空間，搭配container，因此如果要移除狀態，會需要將volume空間也一併移除，否則重建的container會使用相同的空間，導致錯誤延續****



抑或是下面語句
docker rm -f node-red  # 停止並移除原容器

docker run -it -p 1880:1880 -v ~/node-red-data:/data --name node-red my-node-red
