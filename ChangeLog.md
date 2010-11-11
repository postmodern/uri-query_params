### 0.5.1 / 2010-11-11

* Added {URI::QueryParam::Mixin#initialize_copy} to properly copy the
  `query_params` when calling `clone` or `dup` on a URI.

### 0.5.0 / 2010-11-07

* Added {URI::QueryParams.dump}.
* Added `uri/query_params/extensions/https.rb`.
* Fixed a bug in {URI::QueryParams.parse}, where query param values
  containing `=` characters were not properly parsed.

### 0.4.0 / 2010-08-28

* Initial release.

