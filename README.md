docker run -i -p 3000:3000 seabaylea/nodeserver:1.0.0
docker build . -t nodeserver-run
docker tag nodeserver-run nodeserver:1.0.0