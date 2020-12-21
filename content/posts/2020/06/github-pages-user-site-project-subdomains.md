---
title: "Hosting a GitHub User Site with Project Subdomains"
date: 2020-06-30T19:15:15-07:00
showDate: true
draft: false
tags: ["blog"]
---

I started this site with the original purpose of hosting my resume for easy sharing without much else in mind. That's still mostly all it does, but I've solved a few problems along the way to make deployments (slightly) cleaner, so I thought I would document my process here.

I keep my resume in version control in a markdown file, and then use the fabulous [Pandoc](https://pandoc.org/) to convert it to a variety of formats, namely an HTML file for hosting and a PDF file for sharing over email. The code can be found [here](https://github.com/jordancrane/pandoc_resume), which is forked from [The Markdown Resume](https://github.com/mszep/pandoc_resume), which is based on [this](https://blog.chmd.fr/editing-a-cv-in-markdown-with-pandoc.html) blog post. So suffice it to say this is not my idea, but I love the approach and have tweaked it along the way to meet my needs. In order to get the generated files from my resume repository into my GitHub Pages [site repository](https://github.com/jordancrane/site), I was originally using a submodule and simply generating the resume files as part of the deployment process. This had a few drawbacks:

  * Every time I changed my resume I had to redeploy the whole site.
  * I use `docker-compose` to build the resume, and Docker was attempting to use the same container to build it in the resume repository and in the site submodule. This meant I had to run `docker container rm` every time I switched between updating the resume and deploying the site.

In order to mitigate these issues I decided to host the resume independently as its own GitHub pages project site, and simply link to it from this site. I could have just used the built-in GitHub Pages setup of the project site being a path under my user site, but I liked the idea of making it a subdomain more (`resume.jordancrane.me` just looks more appealing than `jordancrane.me/pandoc_resume/` to me, and I'm a sucker for details that literally no one else will notice). To deploy the generated files from my resume repository I opted to [use a subtree](https://gist.github.com/cobyism/4730490) due to the simplicity. This isn't _ideal_ so I may revisit it in the future, but it works for now. Assuming that you already have your personal site configured with a custom domain (GitHub's [documentation](https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site) on this is pretty good) adding a subdomain is pretty straightforward. All you need to do is configure a `CNAME` file in the root of your deployment branch with your desired subdomain, mine looks like this: 

```
resume.jordancrane.me
```

Then you simply configure that as your project's custom domain under the repository settings, and add a new CNAME record to your DNS provider that directs the subdomain host (`resume`) to your GitHub Pages domain (`jordancrane.github.io.`). This is pretty simple, and GitHub also documents this well, but I was initially confused by the fact that it doesn't need to point directly to the project site.

Now that I've configured this, I can deploy my resume individually directly from it's repository, without deploying the entire site. Additionally I was able to remove the `docker-compose` step from the build process for the site, so I no longer have to deal with container conflicts from building it in multiple places. I'm sure there are better ways still to do this, but I'd be lying if I said the small quality of life improvements brought by this change don't bring me some joy. My next step is to move my deployment processes into GitHub Actions so I can get rid of my bad deploy scripts, but I'll save that for another day.
