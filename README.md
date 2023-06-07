# Kustomize Config File Patch

```bash
kustomize build --load-restrictor=LoadRestrictionsNone base/        # have a look at the base
kustomize build --load-restrictor=LoadRestrictionsNone env/test/    # overwrite the app config
```