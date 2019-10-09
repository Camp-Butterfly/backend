import cors from 'cors';
import express from 'express';

import {
	ApolloServer
} from 'apollo-server-express';

// initialize Express application
const app = express();

// allow external applications (e.g. frontend) to access backend
app.use(cors());

// initialize Apollo server instance

const server = new ApolloServer({});

// applies Express app as middleware
server.applyMiddleware({
	app,
	path: '/graphql'
});

app.listen({
	port: 8080
}, () => {
	console.log('Apollo Sever on https://localhost:8080/graphql');
});
