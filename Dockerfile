FROM node:slim

# run install basics
RUN apt-get update
RUN apt-get install -y git python build-essential

# run install code
RUN git clone https://github.com/CharlieHess/slack-poker-bot.git /poker/
RUN npm install /poker/

# run install deps
WORKDIR /poker/
RUN npm install babel \
	underscore-plus \
	rx \
	slack-client \
	poker-evaluator \
	text-table \
	lwip \
	imgur \
	promisify-node \
	uuid

# copy things
COPY entrypoint.sh /poker/
COPY token.txt /poker/

# entrypoint script
CMD ["/poker/entrypoint.sh"]