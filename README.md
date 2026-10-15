# Learning from Language Lab website

Source for the lab website at <https://l3.cs.unc.edu> (also reachable at l3-unc.github.io, which redirects), built with [Jekyll](https://jekyllrb.com) and hosted on GitHub Pages.
There is no CSS framework and no JavaScript dependency: the design lives in
[`assets/css/style.css`](assets/css/style.css) and [`assets/js/site.js`](assets/js/site.js).

Almost everything is data-driven. To update the site, edit a file in [`_data/`](_data/) and open a pull request.

| To change...            | Edit                                    |
|-------------------------|-----------------------------------------|
| Lab name, contact, form | [`_config.yml`](_config.yml)            |
| Papers                  | [`_data/publications.yml`](_data/publications.yml) |
| News                    | [`_data/news.yml`](_data/news.yml)      |
| Current members         | [`_data/people.yml`](_data/people.yml)  |
| Alumni                  | [`_data/alumni.yml`](_data/alumni.yml)  |
| Research directions     | [`_data/directions.yml`](_data/directions.yml) (3 directions; shown on /research/ and as tags on the home-page highlights) |
| Paper topics            | [`_data/themes.yml`](_data/themes.yml) (each theme belongs to one direction) |

## Add a paper
1. Add an entry at the top of `_data/publications.yml`. The field reference is at the top of that file.
   Use short venue names (`ACL`, `EMNLP`, `COLM`...); the year comes from `date`. Mark orals/short papers/findings with `badges`.
   Choose one `theme` from `_data/themes.yml`. Add `short` (e.g. `OPeX`) and `selected: true` to list it under its direction.
2. Use full author names. Names matching `people.yml` or `alumni.yml` are automatically linked and bolded.
3. To make it a home-page highlight, set `feature_rank` (1-6) plus a `question` and a one-sentence `finding` stating the result.
   An `image` is optional: put the figure in `images/pubpic/` and run `scripts/optimize_pubpic.sh your_figure.png`
   (the site publishes the compressed copy in `images/pubpic/web/`). Without one, a typographic tile is shown.

## Add news
Add an item at the top of `_data/news.yml` with an ISO date (`2026-10-10`). HTML is allowed in `headline` (for links).

## People
- **Someone joins:** add them to `people.yml` and a square photo to `images/teampic/`, then run `./compress_bios.sh` (200x200 copies go to `images/bios_compressed/`).
- **Someone leaves:** move their entry from `people.yml` to the top of `alumni.yml` (note the slightly different fields: `duration`, optional `now`).

## Preview locally
```
bundle install
bundle exec jekyll serve      # http://localhost:4000
```
(Uses the Jekyll in `Gemfile`; GitHub Pages builds the site itself when you push to `main`.)

## Notes
- To add a group photo to the Team page, set `group_photo` in `_config.yml` (e.g. `/images/group.jpg`).
- Analytics are off. To enable Google Analytics 4, set `google_analytics: "G-XXXXXXXXXX"` in `_config.yml`.
- The previous Bootstrap-based templates are preserved in git history (before the redesign).
- Old URLs (`/allnews.html`, `/topicwise_publications/`, `/vacancies/`) redirect to the new pages.
