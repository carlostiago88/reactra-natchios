# You should always specify a full version here to ensure all of your developers
# are running the same version of Node.
FROM node:10-alpine

RUN apk add --no-cache make gcc g++ python git yarn bash \
	&& rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

# Webpack - It's already preconfigured in create-react-app
# RUN yarn global add webpack
# React
RUN yarn global add create-react-app prop-types react-router-dom

ENV APP_PATH /usr/src/reactra-natchios/app

WORKDIR $APP_PATH

# Copy all local files into the image.
COPY . APP_PATH

# Set the command to start the node server.
CMD ["yarn", "start", "port", "5000"]

# Tell Docker about the port we'll run on.
EXPOSE 5000