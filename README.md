# Bitbucket

A Ruby client library for Bitbucket REST API v2 with oauth authentication.

**WARNING** This gem is under development.

This gem is inspired by [vongrippen/bitbucket](https://github.com/vongrippen/bitbucket). Thanks.

## Installation

Add this line to your application's Gemfile:

    gem 'bitbucket'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitbucket

## Usage

**WARNING** These specs will be changed at any time.

### init

```
bucket = Bitbucket.new(oauth_key: 'key', oauth_secret: 'secret')
```

```
bucket = Bitbucket.new do |config|
  config.oauth_key    = 'key'
  config.oauth_secret = 'secret'
end
```

#### repositories Endpoint

```
# [ ] GET a list of all public repositories
repos = bucket.repos

# [ ] GET a list of repositories for an account
repos  = bucket.repos(owner: 'someone')
```

repos is an array contains Bitbucket::Repository object.

##### repository Resource

```
# [ ] GET a repository
repo = bucket.repo('someone', 'great_repo').find

# [ ] POST a new repository
repo = bucket.repo('someone', 'great_repo').create(params)

# [ ] DELETE a repository
       bucket.repo('someone', 'great_repo').destroy

# [ ] GET a list of watchers
watchers = bucket.repo('someone', 'great_repo').watchers

# [ ] GET a list of forks
repos = bucket.repo('someone', 'great_repo').forks
```

##### pullrequests Resource

```
repo = bucket.repo('someone', 'great_repo')

# [ ] GET a list of open pull requests
pull_requests = repo.pull_requests(options)

# [ ] POST (create) a new pull request
                repo.pull_request(params).create

# [ ] PUT a pull request update
                repo.pull_request(pr_id).update(params)

# [ ] GET a specific pull request
pull_request   = repo.pull_request(pr_id).find

# [ ] GET the commits for a pull request
commits = repo.pull_request(pr_id).commits

# [ ] POST a pull request approval
                 repo.pull_request(pr_id).approve

# [ ] DELETE a pull request approval
                 repo.pull_request(pr_id).unapprove

# [ ] GET the diff for a pull request
diff = repo.pull_request(pr_id).diff

# [ ] GET the log of all of a repository's pull request activity
activities = repo.pull_requests_activities(options) # TODO: fix method name.

# [ ] GET the activity for a pull request
activities = repo.pull_request(pr_id).activities(options)

# [ ] Accept and merge a pull request
             repo.pull_request(pr_id).merge(options)

# [ ] Decline or reject a pull request
             repo.pull_request(pr_id).decline(options)

# [ ] GET a list of pull request comments
comments = repo.pull_request(pr_id).comments

# [ ] GET an individual pull request comment
comment = repo.pull_request(pr_id).comment(comment_id)
```

##### commits or commit Resource

```
repo = bucket.repo('someone', 'great_repo')

# [ ] GET a commits list for a repository or compare commits across branches
# branchortag, include, exclude options
commits = repo.commits(options)

# [ ] GET an individual commit
commit = repo.commit('revision').find

# [ ] GET a list of commit comments
comments = repo.commit('revision').comments

# [ ] GET an individual commit comment
comment = repo.commit('revision').comment(comment_id)

# [ ] POST a commit approval
  repo.commit('revision').approve

# [ ] DELETE a commit approval
  repo.commit('revision').unapprove
```

##### branch-restrictions Resource

```
pending
```

##### diff Resource

```
pending
```

#### teams Endpoint

```
# [ ] GET the team profile
profile = bucket.team('team name').profile

# [ ] GET the team members
members = bucket.team('team name').members

# [ ] GET the team followers
followers = bucket.team('team name').followers

# [ ] GET the team's repositories
repos = bucket.team('team name').repos
```

#### users Endpoint

```
# [ ] GET the user profile
profile = bucket.user('user name').profile

# [ ] GET the list of followers
followers = bucket.user('user name').followers

# [ ] GET a list of accounts the user is following
followings = bucket.user('user name').followings

# [ ] GET the user's repositories
repos = bucket.user('user name').repos
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bitbucket/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
