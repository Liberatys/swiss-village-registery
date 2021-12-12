# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "thermite/tasks"

RSpec::Core::RakeTask.new(:spec)

require "standard/rake"

Thermite::Tasks.new

desc "System Details"
task :sysinfo do
  puts "** SwissVillageRegistery - swiss_village_registery v#{SwissVillageRegistery::VERSION} **"
  puts RUBY_DESCRIPTION
  puts `rustc -Vv`
  puts `ldd --version`.scan(/(.*)\n/).first if RbConfig::CONFIG["host_os"].to_s[/linux/]
  puts `cargo -Vv`
  deps = Regexp.new(/name = "([\w\-]+)"\nversion = "(\d+\.\d+\.\d+)"/)
  puts "** Rust dependencies **"
  IO.read("Cargo.lock")
    .scan(deps)
    .delete_if { |i| i[0] == "swiss_village_registery" }
    .each { |name, version| puts "#{name.ljust(20)}#{version}" }
  puts "** Ruby dependencies **"
  deps = IO.read("Gemfile.lock")
  puts deps[(deps =~ /DEPENDENCIES/)..].sub("\n\n", "\n")
  puts "RAKE\n   #{Rake::VERSION}"
end

desc "Build + clean up Rust extension"
task build_lib: "thermite:build" do
  sh "cargo clean"
end

desc "Run Rust Tests"
task :cargo do
  ruby_lib = RbConfig::CONFIG["libdir"]
  sh(
    {
      "LD_LIBRARY_PATH" => ruby_lib,
      "DYLD_LIBRARY_PATH" => ruby_lib
    },
    "cargo -vv test -- --nocapture"
  )
end

desc "Code Quality Check"
task :lint do
  puts
  puts "Quality check starting..."
  sh "bin/format"
  sh "cargo fmt"
  puts
end

desc "Run Rust & Ruby Tests"
task :test do
  sh "cargo build --release"
  sh "bundle exec rspec"
end

task default: :test
