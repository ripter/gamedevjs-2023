/* https://github.com/WebReflection/a-route */
import { pathToRegexp } from './path-to-regexp.js';

const {create, freeze, keys} = Object;

const Class = customElements.get('a-route');

const app = Class ? Class.app : freeze({

	_: freeze({
		params: create(null),
		paths: create(null)
	}),

	get(path) {
		for (let
			{paths} = app._,
			keys = [],
			all = path === '*',
			re = all ? '*' : asPath2RegExp(path, keys),
			info = paths[re] || (paths[re] = {
				keys,
				re,
				cb: []
			}),
			i = 1, {length} = arguments;
			i < length; i++
		) {
			info.cb.push(arguments[i]);
		}
		return app;
	},

	delete(path) {
		for (let
			all = path === '*',
			re = all ? '*' : asPath2RegExp(path, []),
			info = app._.paths[re],
			i = 1, {length} = arguments;
			i < length; i++
		) {
			const cb = arguments[i];
			const index = info ? info.cb.lastIndexOf(cb) : -1;
			if (-1 < index)
				info.cb.splice(index, 1);
		}
		return app;
	},

	navigate(path, operation) {
		navigate(
			path,
			!operation || operation === 'push' ? 1 : (
				operation === 'replace' ? -1 : 0
			)
		);
	},

	param(name, cb) {
		for (let
			{params} = app._,
			names = [].concat(name),
			i = 0, {length} = names;
			i < length; i++
		) {
			params[names[i]] = cb;
		}
		return app;
	},

	use(mount, cb) {
		if (typeof mount === 'function') {
			cb = mount;
			mount = '(.*)';
		}
		for (let
			paths = [].concat(mount),
			i = 0, {length} = paths;
			i < length; i++
		) {
			app.get(paths[i], cb);
		}
		return app;
	}
});

const isModifiedEvent = ({metaKey, altKey, ctrlKey, shiftKey}) =>
	!!(metaKey || altKey || ctrlKey || shiftKey);

const ARoute = Class || class ARoute extends HTMLAnchorElement {
	static get app() { return app; }
	connectedCallback() { this.addEventListener('click', this); }
	disconnectedCallback() { this.removeEventListener('click', this); }
	handleEvent(event) {
		// Let the browser handle modified click events (ctrl-click etc.)
		if (isModifiedEvent(event))
			return;

		event.preventDefault();
		if (this.hasAttribute('no-propagation'))
			event.stopPropagation();
		const {pathname, search, hash} = new URL(this.href);
		const path = pathname + search + hash;
		navigate(path, this.hasAttribute('replace') ? -1 : 1);
	}
}

if (!Class) {
	customElements.define('a-route', ARoute, {extends: 'a'});
	addEventListener('popstate', function () {
		const {pathname, search, hash} = location;
		navigate(pathname + search + hash, 0);
	});
}

export {app, ARoute};

function asPath2RegExp(path, keys) {
	if (typeof path !== 'string') {
		path = path.toString();
		path = path.slice(1, path.lastIndexOf('/'));
	}
	return pathToRegexp(path, keys);
}

function byKey(key) {
	return key in this;
}

function callNext(ctx, cbs) {
	const invoked = [];
	(function next() {
		const cb = cbs.shift();
		if (cb) {
			if (invoked.lastIndexOf(cb) < 0) {
				invoked.push(cb);
				cb(ctx, next);
			} else {
				next();
			}
		}
	}());
}

function createParams(match, keys) {
	const params = create(null);
	for (let i = 1, {length} = match; i < length; i++) {
		if (match[i] != null)
			params[keys[i - 1].name] = match[i];
	}
	return params;
}

function navigate(path, operation) {
	const {params, paths} = app._;
	if (operation < 0)
		history.replaceState(location.href, document.title, path);
	else if (operation)
		history.pushState(location.href, document.title, path);
	for (let key in paths) {
		if (key === '*')
			continue;
		const info = paths[key];
		const match = info.re.exec(path);
		if (match) {
			const ctx = {
				path,
				params: createParams(match, info.keys)
			};
			const all = keys(ctx.params).filter(byKey, params);
			return (function param() {
				if (all.length) {
					const key = all.shift();
					params[key](ctx, param, ctx.params[key]);
				}
				else
					callNext(ctx, info.cb.slice(0));
			}());
		}
	}
	if ('*' in paths)
		callNext({path}, paths['*'].cb.slice(0));
}