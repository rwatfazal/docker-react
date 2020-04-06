# Use alpine
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
# Install dependencies
RUN npm install
COPY . .
# Run 'npm run build'
CMD ["npm", "run", "build"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html