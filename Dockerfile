FROM node:alpine as builder


WORKDIR '/app'
COPY package*.json ./

#Install some dependencies 
COPY  . . 
RUN  npm install



#Default command
RUN npm run build 

FROM nginx
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html



