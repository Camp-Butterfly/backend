import { gql } from "apollo-server-express";

import noteSchema from "./notes";

const linkSchema = gql`
	type Query {
		_: Boolean
	}

	type Mutatoin {
		_: Boolean
	}

	type Subscription {
		_: Boolean
	}
`;

export default [linkSchema, noteSchema];
