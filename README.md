# Prioritized Issues

My team at GitHub prioritizes our issues into three buckets, Current, Backlog, and Icebox.

I move an issue from Backlog to Current and assign it to myself when I start working on it. Any new issues that come in during the week go into the Icebox. Once a week we have a meeting where we decide as a team what issues should become a priority and get moved from the Icebox to the Backlog. When we complete an issue we check close it.

We have been using a single tracking issue with three task lists to represent the three buckets. This requires manually editing the text of the issue each time you want to pick something off of the backlog. It requires a massive edit during our weekly planning meeting. It also requires editing every time a new issue comes to our attention that we may be responsible for.

This app aims to solve alleviate some of the pain of our current process.

![i got issues](http://cl.ly/image/1h1e03010B2B/i-got-issues-2.gif)

## Usage

Clone the repo and run bundler.

```bash
git clone https://github.com/jonmagic/i-got-issues.git
cd i-got-issues
bundle
```

Now go to https://github.com/settings/applications and register a new application. You'll need the *Client ID* and *Client Secret*, if you run the server locally the *Authorization callback URL* is http://127.0.0.1:3000/auth/github/callback.

Create a `.env` file in the root of the project and enter the following details filling in with the values you just copied after registering a new application:

```
GITHUB_KEY=client_id_from_the_app_you_just_registered
GITHUB_SECRET=client_secret_from_the_app_you_just_registered
```

Now bootstrap the database and start the server.

```bash
rake db:setup
rails server
```

Open your browser to http://localhost:3000 and choose a team :) Enjoy!

## Development

Run the tests with `rake`.

## Deploying

I setup the app on Heroku in a matter of minutes. You shouldn't have any problems.

1. Create the Heroku app and add the remote to your local git repository
1. Register app on GitHub https://github.com/settings/applications
1. Set the two environment variables `GITHUB_KEY` and `GITHUB_SECRET` using `heroku config:add`
1. Deploy the app to Heroku with `git push heroku`
1. Run database migrations with `heroku run rake db:migrate`

Fire it up in your browser and see if it worked.

## Contributing

Read the [guide to contributing](https://github.com/jonmagic/i-got-issues/blob/master/CONTRIBUTING.md).

### Contributors

* [@jonmagic](https://github.com/jonmagic)
* [@juliamae](https://github.com/juliamae)
* [*jankeesvw](https://github.com/jankeesvw)

## License

See [LICENSE](https://github.com/jonmagic/i-got-issues/blob/master/LICENSE).
