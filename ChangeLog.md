### 0.7.2 / 2020-11-29

* Use `URI::DEFAULT_PARSER.escape` / `.unescape` instead of the deprecated
  `URI.escape` / `URI.unescape`.

### 0.7.1 / 2015-06-11

* Fixed a Ruby 2.2 specific bug where `alias`es are defined before the method
  they alias. (@iraupph)
* Removed the `URI::Generic#path_query` monkeypatch.
* Override {URI::Generic#to_s} to call the `query` method overrode by
  {URI::QueryParams::Mixin}, instead of `@query`. Starting in Ruby 2.2.0,
  `path_query` was inlined directly into `URI::Generic#to_s` which broke our
  `path_query` monkeypatch.

### 0.7.0 / 2012-03-27

* Inject {URI::QueryParams::Mixin} into {URI::Generic}, so all URIs have
  `query_params`.
* Inject {URI::QueryParams::Mixin} into `Addressable::URI`, if `addressable/uri`
  is loaded.

### 0.6.2 / 2012-03-15

* Fixed a query parameter ordering issue in {URI::QueryParams.dump},
  under Ruby 1.8.x.

### 0.6.1 / 2011-12-31

* Added white-space and unprintable characters to {URI::QueryParams::UNSAFE}.

### 0.6.0 / 2011-12-06

* Allow {URI::QueryParams.parse} to yield query-params, in the order they were
  parsed.

### 0.5.4 / 2011-03-19

* Fixed a bug when parsing query params containing `&&&&`.

### 0.5.3 / 2011-03-11

* Only require `uri/common` for `URI.escape` and `URI.unescape`.

### 0.5.2 / 2010-11-11

* Added {URI::QueryParams::UNSAFE}:
  * Contains RFC 3986 unsafe URI characters.
  * Use {URI::QueryParams::UNSAFE} in {URI::QueryParams.dump} for safer
    query strings.
* Added `URI::QueryParams::Mixin#query`:
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

