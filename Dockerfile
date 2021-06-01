FROM node:alpine as teamalpha

WORKDIR /var/reactapp

COPY ./package.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm" ,"run" , "start" ]


FROM nginx

EXPOSE 80

COPY --from=teamalpha /var/reactapp /usr/share/nginx/html
