+++
categories = ["javascript", "react", "webpack", "ES6", "jasmine"]
date = "2017-02-11T15:22:23+05:30"
description = "Jasmine is well known in javascript world. This post helps you setup "
draft = false
keywords = ["javascript", "react", "webpack", "ES6", "jasmine", "setup jasmine with react", "setup jasmine with webpack"]
slug = ""
tags = ["javascript", "react", "webpack", "ES6", "jasmine"]
title = "How to configure Jasmine test with React, ES6 and Webpack"
toc = false

+++

If you created your app using `react_create_app`, congrats! You saved you saved yourself some time. You now have `jest` up and running correctly. But chances are you configured your `Webpack` and now you want to configure `Jasmine` to test your components and do unit testing. Let's see how can we do that:

### Installing Jasmine

To run your test cases and access jasmine from the command line you will want to install jasmine globally.

```bash
npm install -g jasmine
```

### Initialize jasmine

Jasmine needs some configuration to know where your tests are and what needs to be done with them. Run the below command to initialize the repository.

```bash
jasmine init
```
This command will create a `jasmine.json` file, which will look like this:

```json
{
  // dirctory under which files exists
  "spec_dir": "app/javascript",
  // nameing convention of the file, i.e. file ending in spec.js
  "spec_files": [
    "**/*[sS]pec.js"
  ],
  // helper files are run before specs
  "helpers": [
    "spec_helpers/**/*.js"
  ],
  "stopSpecOnExpectationFailure": false,
  "random": false
}
```

> P.S. Please remove all comments if you copy the above json


### Make jasmine understand ES6

Jasmine cannot understand ES6 syntax by default. So we will have to use `babel`. Install babel like so:

```bash
npm install babel-cli
```

Now create a file called as `run.js` you can place it anywhere, I like to keep it in `spec/`, which should look like this:

```javascript
import Jasmine from 'jasmine';

let jasmine = new Jasmine();
// modify this line to point to your jasmine.json
jasmine.loadConfigFile('app/javascript/spec/support/jasmine.json');
jasmine.execute();
```


### Run the test

Finally to run the test, add the following line inside `scripts` section of your `package.json`:

```json
"test": "babel-node app/javascript/spec/run.js"
```

> Ensure you point to your `run.js` file

now `npm test` will run all your test cases in the spec path specified in jasmine.json file.

### Bonus: handling webpack alias

You should be all good to go, but in case you had some `aliases` in your webpack config then you will need to follow this step. Install `module-alias` like so:

```bash
npm install --save module-alias
```

Then add following line of code in your `package.json` at the end:

```json
"_moduleAliases": {
  "vendor" : "vendor/",
  "js": "app/javascript/"
}
```

feel free to change the aliases above, in my case, I had two aliases called as vendor and js. Now in order to get this aliases load before your test start, you will have to create a file in `helper/`, I will called it `alias_fix.js`.

In that file all you have to do is paste these lines of code:
```javascript
import 'module-alias/register';
```

Now run your tests as usual and everything should work.

### Conclusion

I hope this was helpful. If you find something which can be improved please let me know in the comments below. Thanks for reading.
