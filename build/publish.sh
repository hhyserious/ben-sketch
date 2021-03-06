echo '> merge develop to master...'
git checkout master
git merge develop

echo '> npm run build...'
npm run build

echo '> npm version patch...'
version=$(npm version $1)

echo '> npm publish...'
npm publish

echo '> push gitlab...'
git push origin
git push origin $version

echo '> push github...'
git push github
git push github $version

git checkout develop
git merge master
git push origin
git push github