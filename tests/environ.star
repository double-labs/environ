def case(name, remote):
    environ(
        name   = name,
        remote = cache(of = remote, by = local(path = name+".cache")),
        ref    = name + ".hash",
        files  = ["empty"],
    )

for i in [1, 2]:
    case("gcs-"+str(i), gcs(bucket="twin-environ-tests", prefix=str(i)))
    case("s3-"+str(i), s3(bucket="twin-environ-tests", prefix=str(i), region="eu-west-1", profile="twin-sandbox-admin"))
