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

If Ruby is not installed on your machine, you can follow DigitalOcean's walkthrough: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos

cd into _/backend_ directory and run the following commands:

_sets up backend_

`rake db:setup`

_create postgres models_

`rails db:migrate`

_insert seed data into local backend server_

`rake db:seed`

_start development server_

`rails server`

if you visit `http://localhost:3001` in any browser, the default homepage of ruby on rails should be visible.

#### POST

```
	url: "http://localhost:3001/api/v1/images",
	type: "POST",
	data: { image: { image_name: name, butterfly_name: b_name, location: location }	}
	success: response => {
	}
```

```
	url: "http://localhost:3001/api/v1/butterflies",
	type: "POST",
	data: { butterfly: { butterfly_name: b_name, scientific_name: s_name, image_file_name: i_name, description: desc }	}
	success: response => {
	}
```

#### GET

```
	.getJSON("http://localhost:3001/api/v1/images.json", (response) => { this.setState({ butterflies: response})	});
	
	.getJSON("http://localhost/api/v1/butterflies.json", (response) => { this.setState({ butterflies: response})	});
```

#### DELETE

```
	url: `/api/v1/images/${id}`,
        type: 'DELETE',
        success(response) {
            console.log('successfully removed item')
        }
```


```
	url: `/api/v1/butterflies/${id}`,
        type: 'DELETE',
        success(response) {
            console.log('successfully removed item')
        }
```

#### UPDATE

```
	url: `/api/v1/images/${id}`,
        type: 'PUT',
        success(response) {
            console.log('successfully removed item')
        }
```

```
	url: `/api/v1/butterflies/${id}`,
        type: 'PUT',
        success(response) {
            console.log('successfully removed item')
        }
```



