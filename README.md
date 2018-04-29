Ministry of Velocity
====================

A website to celebrate our sovereign state.


Installation
------------

Install all worthy dependencies with bundler:

    $ bundle install

Then start Middleman for great victories in development:

    $ bundle exec middleman server


Deployment
----------

To spread our greatness across the globe, you must create a useful
[CloudFormation](https://console.aws.amazon.com/cloudformation) stack using the
`site.json` template.  The stack generates some useful outputs.

Then, in the name of our illustrious leaders, you should acquire
[IAM](https://console.aws.amazon.com/iam) credentials with `Put*` access for
the S3 bucket created by that stack, as well as `CreateInvalidation` access
for CloudFormation.

You must also acquire a [Google Analytics](https://analytics.google.com)
tracking id.

Create a `.env` file locally with these entries:

```
    AWS_ACCESS_KEY_ID=
    AWS_SECRET_ACCESS_KEY=
    BUCKET_NAME=
    BUCKET_REGION=
    CLOUDFRONT_DISTRIBUTION_ID=
    GOOGLE_ANALYTICS_TRACKING_ID=
```


Then, follow these important steps:

    $ bundle exec middleman build
    $ bundle exec middleman sync
    $ bundle exec middleman invalidate

After 10 minutes, our adoring public will receive the new revelations.


Contributing
------------

1. Get hang out at Ministry of Velocity LLC
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
