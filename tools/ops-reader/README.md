# ops-reader

Python prototype of the `.OPS` save loader, used to check the decoded
layouts (`specs/001-outpost-reverse-engineering/contracts/ops-save-format.md`)
against real files before the rebuild implements them.

```bash
python ops_objects.py "../../Resource.000 extract/TUTOR.OPS"          # chunk check + summary
python ops_objects.py "../../Resource.000 extract/TUTOR.OPS" --dump   # everything as JSON
```

`ops_parse.py` has the container reader, the value formats and the
version-1 translations; `ops_objects.py` the per-object layouts.
