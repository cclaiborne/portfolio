ActiveSupport::Deprecation.warn "MiniTest::Rails::ActionView::TestCase is deprecated. Please remove 'MiniTest::Rails::' from your tests. Support for this namespace will removed when minitest-rails reaches 1.0 release.\n\nhttps://github.com/blowmage/minitest-rails/wiki/Upgrading-to-0.9"
MiniTest::Rails::ActionView::TestCase = ::ActionView::TestCase
