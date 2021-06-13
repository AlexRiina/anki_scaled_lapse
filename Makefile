.PHONY: clean quick_test test develop

plugin.ankiaddon:
	python setup.py build
	cd build/lib/anki_scaled_lapse/ && zip plugin.ankiaddon -r *
	mv build/lib/anki_scaled_lapse/plugin.ankiaddon .

clean:
	-rm -r build dist **/*.egg-info plugin.ankiaddon
	pyclean .

quick_test:
	flake8 anki_scaled_lapse
	mypy anki_scaled_lapse
	black --check .

test:
	tox

develop:
	ln -s ${PWD}/anki_scaled_lapse ~/.local/share/Anki2/addons21/$$(basename ${PWD})_develop
