FROM node:current-alpine

# Environment variables
ENV HUBOT_NAME name
ENV HUBOT_OWNER owner
ENV HUBOT_DESCRIPTION "There are no strings on me..."
ENV EXTERNAL_SCRIPTS "hubot-help,hubot-redis-brain,hubot-maps,hubot-auth"

RUN adduser hubot -D -h /home/hubot

RUN npm install -g util hubot coffee-script yo generator-hubot

USER hubot

WORKDIR /home/hubot

RUN yo hubot --owner="${HUBOT_OWNER}" --name="${HUBOT_NAME}" --description="${HUBOT_DESCRIPTION}" --defaults && sed -i /heroku/d ./external-scripts.json && sed -i /redis-brain/d ./external-scripts.json && npm install hubot-scripts && npm install hubot-slack --save

COPY  hubot/scripts/ /home/hubot/scripts/

CMD node -e "console.log(JSON.stringify('$EXTERNAL_SCRIPTS'.split(',')))" > external-scripts.json && \
	npm install $(node -e "console.log('$EXTERNAL_SCRIPTS'.split(',').join(' '))") && \
	bin/hubot -n $HUBOT_NAME --adapter slack
