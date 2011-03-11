### 0.5.3 / 2011-03-11

* Only require `uri/common` for `URI.escape` and `URI.unescape`.

### 0.5.2 / 2010-11-11

* Added {URI::QueryParams::UNSAFE}:
  * Contains RFC 3986 unsafe URI characters.
  * Use {URI::QueryParams::UNSAFE} in {URI::QueryParams.dump} for safer
    query strings.
* Added {URI::QueryParams::Mixin#query}:
  * If any query-params are set, dump them out using
    {URI::QueryParams.dump}.
* Renamed `parse_query_params` to
  {URI::QueryParams::Mixin#parse_query_params!}.

### 0.5.1 / 2010-11-11

* Added {URI::QueryParams::Mixin#initialize_copy} to properly copy the
  `query_params` when calling `clone` or `dup` on a URI.

### 0.5.0 / 2010-11-07

* Added {URI::QueryParams.dump}.
* Added `uri/query_params/extensions/https.rb`.
* Fixed a bug in {URI::QueryParams.parse}, where query param values
  containing `=` characters were not properly parsed.

### 0.4.0 / 2010-08-28

* Initial release.

