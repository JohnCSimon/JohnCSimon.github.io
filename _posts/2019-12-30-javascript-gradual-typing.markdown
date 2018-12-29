---
layout: post
title:  "Gradual Typing With Javascript and VS Code"
date:   2018-12-29 11:40:43 -0800
categories: javascript update
---
You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. You can rebuild the site in many different ways, but the most common way is to run `jekyll serve`, which launches a web server and auto-regenerates your site when a file is updated.

To add new posts, simply add a file in the `_posts` directory that follows the convention `YYYY-MM-DD-name-of-post.ext` and includes the necessary front matter. Take a look at the source for this post to get an idea about how it works.

Jekyll also offers powerful support for code snippets:

```javascript

// type annotation https://github.com/Microsoft/TypeScript/wiki/Type-Checking-JavaScript-Files
// JSDoc http://usejsdoc.org/tags-type.html
/**
 * @param {AWS.S3.PutObjectRequest} uploadParameters - parameters for uploadng a font to s3
 * @param {boolean} [dryRun] - dont actually upload
 * @param {boolean} [continueProcessingAfterError] - ignore error and continue despite error
 */
const uploadToS3 = async (uploadParameters, dryRun, continueProcessingAfterError) => {
  if (dryRun) {
    ensureFileSync(uploadParameters.Key);
    writeFileSync(uploadParameters.Key, uploadParameters.Body);
    return `wrote: ${uploadParameters.Key}`;
  }
  try {
    const { Location } = await s3.upload(uploadParameters).promise();
    return Location;
  } catch (e) {
    console.error('S3 Upload Error: ', e);
    console.error(uploadParameters);
    if (continueProcessingAfterError) {
      console.error('Continuing despite error...');
      return JSON.stringify(e); // not sure what we could do with this error
    }
    process.exit(1);
    return 'exiting';
  }
};

```

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
