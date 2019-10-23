## DOCUMENTATION 

#### __installation steps for frontend__

package manager:
	
`brew install yarn`

javascript packages:
	
`brew install node`

tracks changes in development:
	
`brew install watchman`

`brew tap AdoptOpenJDK/openjdk`

`brew cask install adoptopenjdk8`

command-line-tools for react-native:
	
`npm install -g react-native-cli`

start development server:

`react-native run-ios`


#### __installation steps for backend__

Ruby on Rails application that provides a backend API for the application.

setup backend:

`rake db:setup`

create postgres models:	

`rails db:migrate`

insert seed data into local backend server:

`rake db:seed`

start development server:

`rails server`

#### POST

```
	url: "http://localhost/api/v1/images",
	type: "POST",
	data: { image: { image_name: name, butterfly_name: b_name, location: location }	}
	success: response => {
	}
```

```
	url: "http://localhost/api/v1/butterflies",
	type: "POST",
	data: { butterfly: { butterfly_name: b_name, scientific_name: s_name, image_file_name: i_name, description: desc }	}
	success: response => {
	}
```

#### GET

```
	url: "http://localhost/api/v1/images",
	type: "GET",
	data: { image: { image_name: name, butterfly_name: b_name, location: location }	}
	success: response => {
	}
```




