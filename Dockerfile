# Command:
# Docker: docker run --rm -it -v ${PWD}:/srv/jekyll -p "4000:4000" blog
# Container: bundle; bundle exec jekyll s --host 0.0.0.0
# Pull base image.
FROM ubuntu:23.04

# Install Ruby.
RUN \
  apt-get update && \
  apt-get install -y ruby-full build-essential zlib1g-dev

RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
RUN echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
#RUN source ~/.bashrc

RUN gem install jekyll bundler
WORKDIR /srv/jekyll

#ENTRYPOINT [ "sh -c bundle; bundle exec jekyll s --host 0.0.0.0" ]